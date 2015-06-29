module History

  class AliasStringBuilder

    def build_alias_string(unique_hashes, aliaser, hasher)
      alias_hash = hasher.build_alias_hash_array(unique_hashes, aliaser)
      alias_hash.map do |uh| 
        "##{aliaser.sample_string(uh[:command], uh[:alias])}"
      end.join("\n")
    end

  end

  class HashBuilder

    def build_alias_hash_array(unique_hashes, aliaser)
      alias_array = []
      unique_hashes.each do |k,v| 
        alias_array.push( {alias: "#{aliaser.generate(k)}",
                           command: k,
                           count: v})
      end
      alias_array.reject { |ah| ah[:count] <= 3 }
    end

  end

  class Aliaser

    def sample_string(command, example_alias)
      "alias #{example_alias}='#{command}'"
    end

    def generate(string)
      rejected_regex = /[[:blank:]]|[[:digit:]]|[[:punct:]]/
      voweless_string = string.delete "aeiouy"
      downcased = voweless_string.downcase
      downcased.gsub(rejected_regex, '')
    end

  end

  class Parser

    def read_file_to_array(history_file = "#{ENV['HOME']}/.zhistory")
      File.readlines history_file
    end

    def unique_lines_to_array_of_hashes(history)
      h = Hash.new(0)
      history.each { |v| h.store(v.chomp, h[v.chomp]+1) }
      h.reject { |k,v| k.length < 5}
    end

  end

end
