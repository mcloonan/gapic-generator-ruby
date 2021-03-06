# frozen_string_literal: true

# Copyright 2019 Google LLC
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

module Google
  module Ads
    module GoogleAds
      module V1
        module Services
          # Request message for [CampaignService.GetCampaign][google.ads.googleads.v1.services.CampaignService.GetCampaign].
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the campaign to fetch.
          class GetCampaignRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for [CampaignService.MutateCampaigns][google.ads.googleads.v1.services.CampaignService.MutateCampaigns].
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer whose campaigns are being modified.
          # @!attribute [rw] operations
          #   @return [Google::Ads::GoogleAds::V1::Services::CampaignOperation]
          #     The list of operations to perform on individual campaigns.
          # @!attribute [rw] partial_failure
          #   @return [Boolean]
          #     If true, successful operations will be carried out and invalid
          #     operations will return errors. If false, all operations will be carried
          #     out in one transaction if and only if they are all valid.
          #     Default is false.
          # @!attribute [rw] validate_only
          #   @return [Boolean]
          #     If true, the request is validated but not executed. Only errors are
          #     returned, not results.
          class MutateCampaignsRequest
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # A single operation (create, update, remove) on a campaign.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          # @!attribute [rw] create
          #   @return [Google::Ads::GoogleAds::V1::Resources::Campaign]
          #     Create operation: No resource name is expected for the new campaign.
          # @!attribute [rw] update
          #   @return [Google::Ads::GoogleAds::V1::Resources::Campaign]
          #     Update operation: The campaign is expected to have a valid
          #     resource name.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed campaign is
          #     expected, in this format:
          #
          #     `customers/{customer_id}/campaigns/{campaign_id}`
          class CampaignOperation
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for campaign mutate.
          # @!attribute [rw] partial_failure_error
          #   @return [Google::Rpc::Status]
          #     Errors that pertain to operation failures in the partial failure mode.
          #     Returned only when partial_failure = true and all errors occur inside the
          #     operations. If any errors occur outside the operations (e.g. auth errors),
          #     we return an RPC level error.
          # @!attribute [rw] results
          #   @return [Google::Ads::GoogleAds::V1::Services::MutateCampaignResult]
          #     All results for the mutate.
          class MutateCampaignsResponse
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # The result for the campaign mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateCampaignResult
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
