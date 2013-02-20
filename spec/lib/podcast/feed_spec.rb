require_relative "../../../lib/podcast/feed"

describe PodcastRB::Feed do
	describe "when initialized" do
		default_config = PodcastRB::Feed::DEFAULTS
		optional_attribs = [:title, :domain, :url, :description, :image, :language, :version, :about]

	  let(:config) { PodcastRB::Config.new(default_config) }	

		it "creates a new config object" do
			f = PodcastRB::Feed.new

			f.config.source_dir.should       == default_config[:source_dir]
			f.config.destination_dir.should  == default_config[:destination_dir]
			f.config.destination_file.should == default_config[:destination_file]
		end

		it "adds files from source_dir to the Feed's 'files' list" do
			files_from_source_dir = ["one.mp3", "two.mp3", "three.m4v"]
			PodcastRB::Feed.any_instance.stub(:get_files).and_return(files_from_source_dir)

			f = PodcastRB::Feed.new

			f.files.should == files_from_source_dir
		end

		context "if optional values are provided" do
			optional_attribs.each do |attrib|
				it "sets the feed #{attrib.to_s} to value provided" do
					f = PodcastRB::Feed.new(attrib.to_sym => "some value")

					f.send(attrib.to_sym).should == "some value"
				end
			end
		end

		context "if optional values aren't provided" do
			optional_attribs.each do |attrib|
				it "sets the feed #{attrib.to_s} to ''" do
					f = PodcastRB::Feed.new

					f.send(attrib.to_sym).should == ""
				end
			end
		end

	end

	#it "can set various config options"
end
