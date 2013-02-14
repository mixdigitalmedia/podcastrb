module PodcastRB
  class Config

    attr_accessor :source_dir
    
    def initialize(args = {})
      @source_dir = args.fetch(:source_dir)
      
    end

  end
end
