require 'spec_helper'

describe History do

  before :all do 
    @file_name = "#{Dir.pwd}/spec/fixtures/.zhistory"
  end

  describe History::HashBuilder do

    before do
      parser = History::Parser.new
      history = parser.read_file_to_array(@file_name)
      @unique_hashes = parser.unique_lines_to_array_of_hashes(history)
      @alias = History::Aliaser.new
      @hasher = History::HashBuilder.new
    end

    it 'should return a new hash with alias, command, count as values' do
      sample_hash_array = [{:alias=>"lsl", :command=>"ls -al", :count=>5},
       {:alias=>"fngr", :command=>"finger", :count=>7},
       {:alias=>"whm", :command=>"whoami", :count=>10}]
      actual_hash_array = @hasher.build_alias_hash_array(@unique_hashes, @alias)
      expect(actual_hash_array).to eq(sample_hash_array)
    end
  end

  describe History::Aliaser do

    before :all do
      @example_command = 'ls -al; 9'
    end

    before do
      @alias = History::Aliaser.new
    end

    it 'should return an alias for a term' do
      expect(@alias.generate(@example_command)).to eq('lsl')
    end

  end

  describe History::Parser do
    before do
      @parser = History::Parser.new
    end

    it 'should read a file into an array' do
      history = @parser.read_file_to_array(@file_name)
      expect(history).to be_kind_of(Array)
    end

    it 'should build an array of unique hashes with counts' do
      history = @parser.read_file_to_array(@file_name)
      unique_hashes = @parser.unique_lines_to_array_of_hashes(history)
      sample_hash = {"ls -al"=>5, "finger"=>7, "man man"=>1,  "whoami"=>10} 
      expect(unique_hashes).to eq(sample_hash)
    end

  end

end
