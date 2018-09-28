require 'fastlane/action'
require_relative '../helper/update_team_identifier_helper'

module Fastlane
  module Actions
    class UpdateTeamIdentifierAction < Action
      def self.run(params)
        UI.message("The update_team_identifier plugin is working!")
      end

      def self.description
        "Updates the Team Identifier for a given target"
      end

      def self.authors
        ["Jordan Bondo"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "The built in 'update_project_team' action updates the team for ALL targets. This is inconvenient for projects that have multiple targets that belong to multiple teams. This plugin  n provides a way to update the team identifier for just a single target."
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "UPDATE_TEAM_IDENTIFIER_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
