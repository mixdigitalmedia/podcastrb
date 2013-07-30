require_relative './config'

module PodcastRB

  class Feed

    DEFAULTS = {
      :source_dir       => "/mp3s",
      :destination_dir  => ".",
      :destination_file => "podcast.rss"
    }

    attr_accessor :config,
                  :title,
                  :domain,
                  :url,
                  :description,
                  :image,
                  :language,
                  :version,
                  :about,
                  :files

    def initialize(args = {})
      @config      = PodcastRB::Config.new(DEFAULTS)
      @title       = args.fetch(:title)       { "" }
      @domain      = args.fetch(:domain)      { "" }
      @url         = args.fetch(:url)         { "" }
      @description = args.fetch(:description) { "" }
      @image       = args.fetch(:image)       { "" }
      @language    = args.fetch(:language)    { "" }
      @version     = args.fetch(:version)     { "" }
      @about       = args.fetch(:about)       { "" }
      @files       = get_files
    end

    def get_files

    end

  end
end
