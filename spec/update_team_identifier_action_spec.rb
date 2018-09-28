describe Fastlane::Actions::UpdateTeamIdentifierAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The update_team_identifier plugin is working!")

      Fastlane::Actions::UpdateTeamIdentifierAction.run(nil)
    end
  end
end
