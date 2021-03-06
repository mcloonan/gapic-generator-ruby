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
        module Common
          # Settings for the
          # <a href="https://support.google.com/google-ads/answer/7365594">
          # targeting related features</a>, at Campaign and AdGroup level.
          # @!attribute [rw] target_restrictions
          #   @return [Google::Ads::GoogleAds::V1::Common::TargetRestriction]
          #     The per-targeting-dimension setting to restrict the reach of your campaign
          #     or ad group.
          class TargetingSetting
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # The list of per-targeting-dimension targeting settings.
          # @!attribute [rw] targeting_dimension
          #   @return [ENUM(TargetingDimension)]
          #     The targeting dimension that these settings apply to.
          # @!attribute [rw] bid_only
          #   @return [Google::Protobuf::BoolValue]
          #     Indicates whether to restrict your ads to show only for the criteria you
          #     have selected for this targeting_dimension, or to target all values for
          #     this targeting_dimension and show ads based on your targeting in other
          #     TargetingDimensions. A value of 'true' means that these criteria will only
          #     apply bid modifiers, and not affect targeting. A value of 'false' means
          #     that these criteria will restrict targeting as well as applying bid
          #     modifiers.
          class TargetRestriction
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
