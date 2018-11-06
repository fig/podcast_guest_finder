class PodcastRSSFile
  def initialize(show:, contents:)
    @show = show
    @xml_doc = Nokogiri::XML(contents)
  end

  def episodes
    @xml_doc.xpath('//item')
  end

  def consume!
    episodes.each do |episode|
      @show.episodes.create!(
        name: episode.css('title').first.content
      )
    end
  end
end
