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
        module Enums
          # The channel type a campaign may target to serve on.
          class AdvertisingChannelTypeEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing the various advertising channel types.
            module AdvertisingChannelType
              # Not specified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # Search Network. Includes display bundled, and Search+ campaigns.
              SEARCH = 2

              # Google Display Network only.
              DISPLAY = 3

              # Shopping campaigns serve on the shopping property
              # and on google.com search results.
              SHOPPING = 4

              # Hotel Ads campaigns.
              HOTEL = 5

              # Video campaigns.
              VIDEO = 6
            end
          end
        end
      end
    end
  end
end