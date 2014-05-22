require 'pry'
require 'rspec/autorun'

require_relative '../gentleman/base'
require_relative '../gentleman/entry'
require_relative '../gentleman/action/search'
require_relative '../gentleman/handler/list'
require_relative '../gentleman/handler/count'

describe Gentleman do

  subject { Gentleman::Base::new('search \.rb then list') }

  describe 'common behavior' do
    it 'should recognize requested action' do
      expect(subject.entry.action).to eq :search
    end
  end

  describe 'when typing invalid action' do
    subject { Gentleman::Base::new('destroy gentleman_spec.rb then count') }
    it 'should tell that did not understand' do
      expect(subject.execute).to eq 'Sorry Sir, I could not understand you.'
    end
  end

  describe 'searching files' do
    it 'should return an array of files' do
      expect {
        subject.execute.find_all { |file| file =~ /gentleman_spec.rb/ }
      }.to be_true
    end
  end

  describe 'counting 1 file' do
    subject { Gentleman::Base::new('search gentleman_spec.rb then count') }
    it 'should return file count' do
      expect(subject.execute).to eq ['Total of 1 files found.']
    end
  end

  describe 'counting any files' do
    subject { Gentleman::Base::new('search .rb then count') }
    it 'should return file count' do
      expect(subject.execute.first).to match(/Total of \d files found./)
    end
  end

end
