class PostReport < Struct.new(:word_count, :word_histogram)
  def self.generate(post)
    PostReport.new(
      post.content.split.map {|word| word.gsub(/\W/,'') }.count

      calc_histogram(post)
    )


    private

    def self.calc_histogram(post)
      (post
        .content
        .split
        .map {|word| word.gsub(/\W/,'') }
        .map (&:downcase)
        .group_by { |word| word }
        .transform_values(&:size) )
    end


  end
end
