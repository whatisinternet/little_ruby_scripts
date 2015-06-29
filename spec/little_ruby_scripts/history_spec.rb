require 'spec_helper'

describe History do

  before :all do 
    @file_name = "#{Dir.pwd}/spec/fixtures/.zhistory"
  end

  describe History::CommandSearcher do

    before do
      parser = History::Parser.new
      history = parser.read_file_to_array(@file_name)
      @unique_hashes = parser.unique_lines_to_array_of_hashes(history)
      @alias = History::Aliaser.new
      @hasher = History::HashBuilder.new
      @searcher = History::CommandSearcher.new
    end

    it 'should return a similar command' do
      suggested_string = @searcher.suggest('whoam',
                                   @unique_hashes,
                                   @alias,
                                   @hasher)

      expect(suggested_string).to eq('whoami')
    end

    it 'should grab the last string in the history' do
      expect(@searcher.last_from_history(@file_name)).to eq('whoami')
    end

  end
  describe History::AliasStringBuilder do

    before do
      parser = History::Parser.new
      history = parser.read_file_to_array(@file_name)
      @unique_hashes = parser.unique_lines_to_array_of_hashes(history)
      @alias = History::Aliaser.new
      @hasher = History::HashBuilder.new
      @stringer = History::AliasStringBuilder.new
    end

    it 'should return a \n delimited string of aliases' do
      sample_alias_string = ["#alias lsl='ls -al'", 
                             "#alias fngr='finger'", 
                             "#alias whm='whoami'"].join "\n"
      actual_alias_string = @stringer.build_alias_string(@unique_hashes, @alias, @hasher)
      expect(actual_alias_string).to eq(sample_alias_string)
    end

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

    it 'should return a alias string for a term and its\' alias' do
      alias_example = @alias.generate(@example_command)
      example_alias = @alias.sample_string(@example_command, alias_example)
      sample_string = "alias lsl='ls -al; 9'"
      expect(example_alias).to eq(sample_string)
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
