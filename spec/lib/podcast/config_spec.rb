require_relative "../../../lib/podcast/config"
require 'pry'

def default_args
  {
    :source_dir       => "/some/path/to/mp3_files",
    :destination_dir  => "/some/destination/path/",
    :destination_file => "test_feed.rss"
  }
end

describe PodcastRB::Config do
  let(:config) { PodcastRB::Config.new(default_args) }

  describe "when required arguments are provided" do
    it "source_dir is set" do
      config.source_dir.should == "/some/path/to/mp3_files"
    end

    it "destination_dir is set" do
      config.destination_dir.should == "/some/destination/path/"
    end

    it "destination_file is set" do
      config.destination_file.should == "test_feed.rss"
    end
  end

  describe "when required arguments are missing" do
    it "raises an exception if no source_dir is specified" do
      invalid_args = default_args
      invalid_args.delete(:source_dir)
      expect { config = PodcastRB::Config.new(invalid_args) }.to raise_error KeyError
    end

    it "raises an exception if no destination_dir is specified" do
      invalid_args = default_args
      invalid_args.delete(:destination_dir)
      expect { config = PodcastRB::Config.new(invalid_args) }.to raise_error KeyError
    end

    it "raises an exception if no destination_file is specified" do
      invalid_args = default_args
      invalid_args.delete(:destination_file)
      expect { config = PodcastRB::Config.new(invalid_args) }.to raise_error KeyError
    end
  end

  describe "when required arguments are nil" do
    it "raises an exception if source_dir is nil" do
      invalid_args = default_args.merge(:source_dir => nil)
      expect { config = PodcastRB::Config.new(invalid_args) }.to raise_error
    end

    it "raises an exception if destination_dir is nil"do 
      invalid_args = default_args.merge(:destination_dir => nil)
      expect { config = PodcastRB::Config.new(invalid_args) }.to raise_error
    end

    it "raises an exception if destination_file is nil" do 
      invalid_args = default_args.merge(:destination_file => nil)
      expect { config = PodcastRB::Config.new(invalid_args) }.to raise_error
    end
  end

  describe "when a block is passed to initializer" do
    it "sets source_dir within the block" do
      config = PodcastRB::Config.new do |c|
        c.source_dir =  "/some/path/to/mp3_files"
      end

      config.source_dir.should == "/some/path/to/mp3_files" 
    end

    it "sets destination_dir within the block" do
      config = PodcastRB::Config.new do |c|
        c.destination_dir =  "/some/destination/path/"
      end

      config.destination_dir.should ==  "/some/destination/path/"
    end

    it "sets destination_file within the block" do
      config = PodcastRB::Config.new do |c|
        c.destination_file =  "test_feed.rss"
      end

      config.destination_file.should ==  "test_feed.rss"
    end
  end

end
