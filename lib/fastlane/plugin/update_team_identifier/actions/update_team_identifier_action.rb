require 'fastlane/action'
require_relative '../helper/update_team_identifier_helper'

module Fastlane
  module Actions
    class UpdateTeamIdentifierAction < Action
      def self.run(params)
        require 'xcodeproj'

        development_team_key = 'DEVELOPMENT_TEAM'

        pdir = params[:xcodeproj] || Dir["*.xcodeproj"].first

        project_file_path = File.join(pdir, "project.pbxproj")
        UI.user_error!("Could not find path to project config '#{project_file_path}'. Pass the path to your project (NOT workspace!)") unless File.exist?(project_file_path)
        target = params[:target]
        configuration = params[:configuration]

        project = Xcodeproj::Project.open(pdir)
        project.targets.each do |t|
          if !target || t.name == target
            UI.success("Updating target #{t.name}")
          else
            UI.important("Skipping target #{t.name} as it doesn't match the filter '#{target}'")
            next
          end

          t.build_configuration_list.build_configurations.each do |config|
            if !configuration || config.name.match(configuration)
              UI.success("Updating configuration #{config.name}")
            else
              UI.important("Skipping configuration #{config.name} as it doesn't match the filter '#{configuration}'")
              next
            end

            config.build_settings[development_team_key] = params[:team_id]
          end
        end
        project.save

        UI.success("Successfully updated project settings in '#{params[:xcodeproj]}'")
      end

      def self.description
        "Updates the Team Identifier for a given target"
      end

      def self.authors
        ["Jordan Bondo"]
      end

      def self.details
        "The built in 'update_project_team' action updates the team for ALL targets. This is inconvenient for projects that have multiple targets that belong to multiple teams. This plugin  n provides a way to update the team identifier for just a single target."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :xcodeproj,
            env_name: "UPDATE_TEAM_IDENTIFIER_XCODEPROJ",
            description: "Path to the .xcodeproj file",
            optional: true,
            verify_block: proc do |value|
              UI.user_error!("Path to Xcode project file is invalid") unless File.exist?(value)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :target,
            env_name: "UPDATE_TEAM_IDENTIFIER_TARGET",
            description: "The target for which to change the Team Identifier. If unspecified the change will be applied to all targets",
            optional: true
          ),
          FastlaneCore::ConfigItem.new(
            key: :configuration,
            env_name: "UPDATE_TEAM_ID_CONFIGURATION",
            description: "The configuration for which to change the Team Identifier. If unspecified the change will be applied to all configurations",
            optional: true
          ),
          FastlaneCore::ConfigItem.new(
            key: :team_id,
            env_name: "UPDATE_TEAM_ID_TEAM_ID",
            description: "Team identifier to use",
            optional: false
          ),
        ]
      end

      def self.is_supported?(platform)
          [:ios, :mac].include?(platform)
        true
      end
    end
  end
end
