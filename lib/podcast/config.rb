module PodcastRB
  class Config

    attr_accessor :source_dir, :destination_dir, :destination_file
    
    def initialize(args = {})
      if block_given?
        yield self
      else
        raise if args.fetch(:source_dir)       == nil
        raise if args.fetch(:destination_dir)  == nil
        raise if args.fetch(:destination_file) == nil

        @source_dir       = args.fetch(:source_dir)
        @destination_dir  = args.fetch(:destination_dir)
        @destination_file = args.fetch(:destination_file)
      end

    end

  end
end
