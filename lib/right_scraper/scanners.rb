#
# Copyright (c) 2013 RightScale Inc
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# ancestor
require 'right_scraper'

module RightScraper
  module Scanners
    autoload :Base, 'right_scraper/scanners/base'
    autoload :CookbookFilenameScanner, 'right_scraper/scanners/cookbook_filename_scanner'
    autoload :CookbookManifest, 'right_scraper/scanners/cookbook_manifest'
    autoload :CookbookMetadata, 'right_scraper/scanners/cookbook_metadata'
    autoload :CookbookMetadataReadOnly, 'right_scraper/scanners/cookbook_metadata_readonly'
    autoload :CookbookS3Upload, 'right_scraper/scanners/cookbook_s3_upload'
    autoload :Union, 'right_scraper/scanners/union'
    autoload :WorkflowManifest, 'right_scraper/scanners/workflow_manifest'
    autoload :WorkflowMetadata, 'right_scraper/scanners/workflow_metadata'
    autoload :WorkflowS3Upload, 'right_scraper/scanners/workflow_s3_upload'
  end
end
