#--
# Copyright: Copyright (c) 2010 RightScale, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# 'Software'), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))
require 'right_scraper_base/repositories/mock'

describe RightScale::Repositories::Git do
  it_should_behave_like "Development mode environment"

  shared_examples_for 'git repository' do
    it 'should have the same repository hash with or without credentials' do
      initial_hash = @repo.repository_hash
      @repo.first_credential = nil
      @repo.repository_hash.should == initial_hash
    end

    it 'should have the same checkout hash with or without credentials' do
      initial_hash = @repo.checkout_hash
      @repo.first_credential = nil
      @repo.checkout_hash.should == initial_hash
    end

    it 'should have a different checkout hash from repository hash' do
      @repo.repository_hash.should_not == @repo.checkout_hash
    end

    it 'should have the same repository hash regardless of tag' do
      initial_hash = @repo.repository_hash
      @repo.tag = 'bar'
      @repo.repository_hash.should == initial_hash
    end

    it 'should have different checkout hashes as tags change' do
      initial_hash = @repo.checkout_hash
      @repo.tag = 'bar'
      @repo.checkout_hash.should_not == initial_hash
    end
  end

  context 'with an HTTP scheme' do
    before(:each) do
      @repo = RightScale::Repository.from_hash(:display_name => 'test repo',
                                               :repo_type => :git,
                                               :url => "http://foo.bar.baz.quux/%20CBLAH",
                                               :tag => 'foo',
                                               :first_credential => "foo:b/ar")
    end

    it 'should have a checkout hash' do
      @repo.checkout_hash.should == '9985f68cc380c3f57315fb4055b469b643115382'
    end

    it_should_behave_like 'git repository'
  end

  context 'with a git scheme' do
    before(:each) do
      @repo = RightScale::Repository.from_hash(:display_name => 'test repo',
                                               :repo_type => :git,
                                               :url => "git://foo.bar.baz.quux/%20CBLAH",
                                               :tag => 'foo',
                                               :first_credential => "foo:b/ar")
    end

    it 'should have a checkout hash' do
      @repo.checkout_hash.should == '988531b4e8433788fd620d778bea195cde74ebdc'
    end

    it_should_behave_like 'git repository'
  end

  context 'with an ssh-type scheme' do
    before(:each) do
      @repo = RightScale::Repository.from_hash(:display_name => 'test repo',
                                               :repo_type => :git,
                                               :url => "foo@bar.baz.quux:/%20CBLAH",
                                               :tag => 'foo',
                                               :first_credential => "foo:b/ar")
    end

    it 'should have a checkout hash' do
      @repo.checkout_hash.should == '57e583d27b485809957b1893f41af35620956b08'
    end

    it_should_behave_like 'git repository'
  end
end
