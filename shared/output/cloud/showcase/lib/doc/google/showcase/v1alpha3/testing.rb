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

raise "This file is for documentation purposes only."

module Google
  module Showcase
    module V1alpha3
      # A session is a suite of tests, generally being made in the context
      # of testing code generation.
      #
      # A session defines tests it may expect, based on which version of the
      # code generation spec is in use.
      # @!attribute [rw] name
      #   @return [String]
      #     The name of the session. The ID must conform to ^[a-z]+$
      #     If this is not provided, Showcase chooses one at random.
      # @!attribute [rw] version
      #   @return [ENUM(Version)]
      #     Required. The version this session is using.
      class Session
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods

        # The specification versions understood by Showcase.
        module Version
          # Unspecified version. If passed on creation, the session will default
          # to using the latest stable release.
          VERSION_UNSPECIFIED = 0

          # The latest v1. Currently, this is v1.0.
          V1_LATEST = 1

          # v1.0. (Until the spec is "GA", this will be a moving target.)
          V1_0 = 2
        end
      end

      # The request for the CreateSession method.
      # @!attribute [rw] session
      #   @return [Google::Showcase::V1alpha3::Session]
      #     The session to be created.
      #     Sessions are immutable once they are created (although they can
      #     be deleted).
      class CreateSessionRequest
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end

      # The request for the GetSession method.
      # @!attribute [rw] name
      #   @return [String]
      #     The session to be retrieved.
      class GetSessionRequest
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end

      # The request for the ListSessions method.
      # @!attribute [rw] page_size
      #   @return [Integer]
      #     The maximum number of sessions to return per page.
      # @!attribute [rw] page_token
      #   @return [String]
      #     The page token, for retrieving subsequent pages.
      class ListSessionsRequest
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end

      # Response for the ListSessions method.
      # @!attribute [rw] sessions
      #   @return [Google::Showcase::V1alpha3::Session]
      #     The sessions being returned.
      # @!attribute [rw] next_page_token
      #   @return [String]
      #     The next page token, if any.
      #     An empty value here means the last page has been reached.
      class ListSessionsResponse
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end

      # Request for the DeleteSession method.
      # @!attribute [rw] name
      #   @return [String]
      #     The session to be deleted.
      class DeleteSessionRequest
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end

      # Request message for reporting on a session.
      # @!attribute [rw] name
      #   @return [String]
      #     The session to be reported on.
      class ReportSessionRequest
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end

      # Response message for reporting on a session.
      # @!attribute [rw] result
      #   @return [ENUM(Result)]
      #     The state of the report.
      # @!attribute [rw] test_runs
      #   @return [Google::Showcase::V1alpha3::TestRun]
      #     The test runs of this session.
      class ReportSessionResponse
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods

        # The topline state of the report.
        module Result
          RESULT_UNSPECIFIED = 0

          # The session is complete, and everything passed.
          PASSED = 1

          # The session had an explicit failure.
          FAILED = 2

          # The session is incomplete. This is a failure response.
          INCOMPLETE = 3
        end
      end

      # @!attribute [rw] name
      #   @return [String]
      #     The name of the test.
      #     The tests/* portion of the names are hard-coded, and do not change
      #     from session to session.
      # @!attribute [rw] expectation_level
      #   @return [ENUM(ExpectationLevel)]
      #     The expectation level for this test.
      # @!attribute [rw] description
      #   @return [String]
      #     A description of the test.
      # @!attribute [rw] blueprints
      #   @return [Google::Showcase::V1alpha3::Test::Blueprint]
      #     The blueprints that will satisfy this test. There may be multiple blueprints
      #     that can signal to the server that this test case is being exercised. Although
      #     multiple blueprints are specified, only a single blueprint needs to be run to
      #     signal that the test case was exercised.
      class Test
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods

        # A blueprint is an explicit definition of methods and requests that are needed
        # to be made to test this specific test case. Ideally this would be represented
        # by something more robust like CEL, but as of writing this, I am unsure if CEL
        # is ready.
        # @!attribute [rw] name
        #   @return [String]
        #     The name of this blueprint.
        # @!attribute [rw] description
        #   @return [String]
        #     A description of this blueprint.
        # @!attribute [rw] request
        #   @return [Google::Showcase::V1alpha3::Test::Blueprint::Invocation]
        #     The initial request to trigger this test.
        # @!attribute [rw] additional_requests
        #   @return [Google::Showcase::V1alpha3::Test::Blueprint::Invocation]
        #     An ordered list of method calls that can be called to trigger this test.
        class Blueprint
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods

          # A message representing a method invocation.
          # @!attribute [rw] method
          #   @return [String]
          #     The fully qualified name of the showcase method to be invoked.
          # @!attribute [rw] serialized_request
          #   @return [String]
          #     The request to be made if a specific request is necessary.
          class Invocation
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # Whether or not a test is required, recommended, or optional.
        module ExpectationLevel
          EXPECTATION_LEVEL_UNSPECIFIED = 0

          # This test is strictly required.
          REQUIRED = 1

          # This test is recommended.
          #
          # If a generator explicitly ignores a recommended test (see `DeleteTest`),
          # then the report may still pass, but with a warning.
          #
          # If a generator skips a recommended test and does not explicitly
          # express that intention, the report will fail.
          RECOMMENDED = 2

          # This test is optional.
          #
          # If a generator explicitly ignores an optional test (see `DeleteTest`),
          # then the report may still pass, and no warning will be issued.
          #
          # If a generator skips an optional test and does not explicitly
          # express that intention, the report may still pass, but with a
          # warning.
          OPTIONAL = 3
        end
      end

      # An issue found in the test.
      # @!attribute [rw] type
      #   @return [ENUM(Type)]
      #     The type of the issue.
      # @!attribute [rw] severity
      #   @return [ENUM(Severity)]
      #     The severity of the issue.
      # @!attribute [rw] description
      #   @return [String]
      #     A description of the issue.
      class Issue
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods

        # The different potential types of issues.
        module Type
          TYPE_UNSPECIFIED = 0

          # The test was never instrumented.
          SKIPPED = 1

          # The test was started but never confirmed.
          PENDING = 2

          # The test was instrumented, but Showcase got an unexpected
          # value when the generator tried to confirm success.
          INCORRECT_CONFIRMATION = 3
        end

        # Severity levels.
        module Severity
          SEVERITY_UNSPECIFIED = 0

          # Errors.
          ERROR = 1

          # Warnings.
          WARNING = 2
        end
      end

      # The request for the ListTests method.
      # @!attribute [rw] parent
      #   @return [String]
      #     The session.
      # @!attribute [rw] page_size
      #   @return [Integer]
      #     The maximum number of tests to return per page.
      # @!attribute [rw] page_token
      #   @return [String]
      #     The page token, for retrieving subsequent pages.
      class ListTestsRequest
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end

      # The response for the ListTests method.
      # @!attribute [rw] tests
      #   @return [Google::Showcase::V1alpha3::Test]
      #     The tests being returned.
      # @!attribute [rw] next_page_token
      #   @return [String]
      #     The next page token, if any.
      #     An empty value here means the last page has been reached.
      class ListTestsResponse
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end

      # A TestRun is the result of running a Test.
      # @!attribute [rw] test
      #   @return [String]
      #     The name of the test.
      #     The tests/* portion of the names are hard-coded, and do not change
      #     from session to session.
      # @!attribute [rw] issue
      #   @return [Google::Showcase::V1alpha3::Issue]
      #     An issue found with the test run. If empty, this test run was successful.
      class TestRun
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end

      # Request message for deleting a test.
      # @!attribute [rw] name
      #   @return [String]
      #     The test to be deleted.
      class DeleteTestRequest
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end

      # @!attribute [rw] name
      #   @return [String]
      #     The test to have an answer registered to it.
      # @!attribute [rw] answer
      #   @return [String]
      #     The answer from the test.
      # @!attribute [rw] answers
      #   @return [String]
      #     The answers from the test if multiple are to be checked
      class VerifyTestRequest
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end

      # @!attribute [rw] issue
      #   @return [Google::Showcase::V1alpha3::Issue]
      #     An issue if check answer was unsuccessful. This will be empty if the check answer succeeded.
      class VerifyTestResponse
        include Google::Protobuf::MessageExts
        extend Google::Protobuf::MessageExts::ClassMethods
      end
    end
  end
end
