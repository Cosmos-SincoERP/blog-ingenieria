# frozen_string_literal: true

module Jekyll
  class CollectionTagsMerger < Generator
    safe true
    priority :high  # Ejecutar antes de jekyll-archives (prioridad :normal)

    COLLECTIONS = %w[recursos].freeze

    def generate(site)
      COLLECTIONS.each do |collection_name|
        collection = site.collections[collection_name]
        next unless collection

        collection.docs.each do |doc|
          tags = doc.data["tags"]
          next unless tags.is_a?(Array)

          tags.each do |tag|
            site.tags[tag] ||= []
            site.tags[tag] << doc unless site.tags[tag].include?(doc)
          end
        end
      end

      site.tags.each_value { |docs| docs.sort!.reverse! }
    end
  end
end
