# frozen_string_literal: true

# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "minitest/autorun"

require "google/cloud/vision/v1/image_annotator_pb"
require "google/cloud/vision/v1/image_annotator_services_pb"
require "google/cloud/vision/v1/image_annotator"

class CustomTestErrorV1 < StandardError; end
# Mock for the GRPC::ClientStub class.
class MockGrpcClientStubV1
  # @param expected_symbol [Symbol] the symbol of the grpc method to be mocked.
  # @param mock_method [Proc] The method that is being mocked.
  def initialize expected_symbol, mock_method
    @expected_symbol = expected_symbol
    @mock_method = mock_method
  end

  # This overrides the Object#method method to return the mocked method when the mocked method
  # is being requested. For methods that aren"t being tested, this method returns a proc that
  # will raise an error when called. This is to assure that only the mocked grpc method is being
  # called.
  #
  # @param symbol [Symbol] The symbol of the method being requested.
  # @return [Proc] The proc of the requested method. If the requested method is not being mocked
  #   the proc returned will raise when called.
  def method symbol
    return @mock_method if symbol == @expected_symbol

    # The requested method is not being tested, raise if it called.
    proc do
      raise "The method #{symbol} was unexpectedly called during the " \
        "test for #{@expected_symbol}."
    end
  end
end

class MockImageAnnotatorCredentialsV1 < Google::Cloud::Vision::V1::ImageAnnotator::Credentials
  def initialize method_name
    @method_name = method_name
  end

  def updater_proc
    proc do
      raise "The method `#{@method_name}` was trying to make a grpc request. This should not " \
          "happen since the grpc layer is being mocked."
    end
  end
end

describe Google::Cloud::Vision::V1::ImageAnnotator::Client do
  describe "batch_annotate_images" do
    let :custom_error do
      CustomTestErrorV1.new "Custom test error for Google::Cloud::Vision::V1::ImageAnnotator::Client#batch_annotate_images."
    end

    it "invokes batch_annotate_images without error" do
      # Create request parameters
      requests = {}

      # Create expected grpc response
      expected_response = {}
      expected_response = Google::Gax::Protobuf.coerce expected_response, to: Google::Cloud::Vision::V1::BatchAnnotateImagesResponse

      # Mock Grpc layer
      mock_method = proc do |request|
        assert_instance_of Google::Cloud::Vision::V1::BatchAnnotateImagesRequest, request
        assert_equal Google::Gax::Protobuf.coerce(requests, to: Google::Cloud::Vision::V1::AnnotateImageRequest), request.requests
        OpenStruct.new execute: expected_response
      end
      mock_stub = MockGrpcClientStubV1.new :batch_annotate_images, mock_method

      # Mock auth layer
      mock_credentials = MockSpeechCredentialsV1.new "batch_annotate_images"

      Google::Cloud::Vision::V1::ImageAnnotator::Stub.stub :new, mock_stub do
        Google::Cloud::Vision::V1::ImageAnnotator::Credentials.stub :default, mock_credentials do
          client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new

          # Call method
          response = client.batch_annotate_images requests

          # Verify the response
          assert_equal expected_response, response

          # Call method with block
          client.batch_annotate_images requests do |resp, operation|
            # Verify the response
            assert_equal expected_response, resp
            refute_nil operation
          end
        end
      end
    end

    it "invokes batch_annotate_images with error" do
      # Create request parameters
      requests = {}

      # Mock Grpc layer
      mock_method = proc do |request|
        assert_instance_of Google::Cloud::Vision::V1::BatchAnnotateImagesRequest, request
        assert_equal Google::Gax::Protobuf.coerce(requests, to: Google::Cloud::Vision::V1::AnnotateImageRequest), request.requests
        raise custom_error
      end
      mock_stub = MockGrpcClientStubV1.new :batch_annotate_images, mock_method

      # Mock auth layer
      mock_credentials = MockSpeechCredentialsV1.new "batch_annotate_images"

      Google::Cloud::Vision::V1::ImageAnnotator::Stub.stub :new, mock_stub do
        Google::Cloud::Vision::V1::ImageAnnotator::Credentials.stub :default, mock_credentials do
          client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new

          # Call method
          err = assert_raises Google::Gax::GaxError do
            client.batch_annotate_images requests
          end

          # Verify the GaxError wrapped the custom error that was raised.
          assert_match custom_error.message, err.message
        end
      end
    end
  end

  describe "async_batch_annotate_files" do
    let :custom_error do
      CustomTestErrorV1.new "Custom test error for Google::Cloud::Vision::V1::ImageAnnotator::Client#async_batch_annotate_files."
    end

    it "invokes async_batch_annotate_files without error" do
      # Create request parameters
      requests = {}

      # Create expected grpc response
      expected_response = {}
      expected_response = Google::Gax::Protobuf.coerce expected_response, to: Google::Longrunning::Operation
      result = Google::Protobuf::Any.new
      result.pack expected_response
      operation = Google::Longrunning::Operation.new(
        name:     "operations/async_batch_annotate_files_test",
        done:     true,
        response: result
      )

      # Mock Grpc layer
      mock_method = proc do |request|
        assert_instance_of Google::Cloud::Vision::V1::AsyncBatchAnnotateFilesRequest, request
        assert_equal Google::Gax::Protobuf.coerce(requests, to: Google::Cloud::Vision::V1::AsyncAnnotateFileRequest), request.requests
        OpenStruct.new execute: operation
      end
      mock_stub = MockGrpcClientStubV1.new :async_batch_annotate_files, mock_method

      # Mock auth layer
      mock_credentials = MockSpeechCredentialsV1.new "async_batch_annotate_files"

      Google::Cloud::Vision::V1::ImageAnnotator::Stub.stub :new, mock_stub do
        Google::Cloud::Vision::V1::ImageAnnotator::Credentials.stub :default, mock_credentials do
          client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new

          # Call method
          response = client.async_batch_annotate_files requests

          # Verify the response
          assert_equal expected_response, response.response
        end
      end
    end

    it "invokes async_batch_annotate_files and returns an operation error." do
      # Create request parameters
      requests = {}

      # Create expected grpc response
      operation_error = Google::Rpc::Status.new(
        message: "Operation error for Google::Cloud::Vision::V1::ImageAnnotator::Client#async_batch_annotate_files."
      )
      operation = Google::Longrunning::Operation.new(
        name:  "operations/async_batch_annotate_files_test",
        done:  true,
        error: operation_error
      )

      # Mock Grpc layer
      mock_method = proc do |request|
        assert_instance_of Google::Cloud::Vision::V1::AsyncBatchAnnotateFilesRequest, request
        assert_equal Google::Gax::Protobuf.coerce(requests, to: Google::Cloud::Vision::V1::AsyncAnnotateFileRequest), request.requests
        OpenStruct.new execute: operation
      end
      mock_stub = MockGrpcClientStubV1.new :async_batch_annotate_files, mock_method

      # Mock auth layer
      mock_credentials = MockSpeechCredentialsV1.new "async_batch_annotate_files"

      Google::Cloud::Vision::V1::ImageAnnotator::Stub.stub :new, mock_stub do
        Google::Cloud::Vision::V1::ImageAnnotator::Credentials.stub :default, mock_credentials do
          client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new

          # Call method
          response = client.async_batch_annotate_files requests

          # Verify the response
          assert response.error?
          assert_equal operation_error, response.error
        end
      end
    end

    it "invokes async_batch_annotate_files with error" do
      # Create request parameters
      requests = {}

      # Mock Grpc layer
      mock_method = proc do |request|
        assert_instance_of Google::Cloud::Vision::V1::AsyncBatchAnnotateFilesRequest, request
        assert_equal Google::Gax::Protobuf.coerce(requests, to: Google::Cloud::Vision::V1::AsyncAnnotateFileRequest), request.requests
        raise custom_error
      end
      mock_stub = MockGrpcClientStubV1.new :async_batch_annotate_files, mock_method

      # Mock auth layer
      mock_credentials = MockSpeechCredentialsV1.new "async_batch_annotate_files"

      Google::Cloud::Vision::V1::ImageAnnotator::Stub.stub :new, mock_stub do
        Google::Cloud::Vision::V1::ImageAnnotator::Credentials.stub :default, mock_credentials do
          client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new

          # Call method
          err = assert_raises Google::Gax::GaxError do
            client.async_batch_annotate_files requests
          end

          # Verify the GaxError wrapped the custom error that was raised.
          assert_match custom_error.message, err.message
        end
      end
    end
  end
end
