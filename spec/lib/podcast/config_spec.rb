require_relative "../../../lib/podcast/config"

describe PodcastRB::Config do
  describe "a valid config file" do
    it "allows a source_dir to be specified" do
      config = PodcastRB::Config.new(:source_dir => "/some/path/to/mp3_files")

      config.source_dir.should == "/some/path/to/mp3_files"
    end

    it "raises an exception if no source_dir is specified)" do
      expect { config = PodcastRB::Config.new }.to raise_error KeyError
    end

  end
end
