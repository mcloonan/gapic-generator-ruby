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

require "googleauth"

module Google
  module Ads
    module GoogleAds
      module V1
        module Services
          module CampaignService
            class Credentials < Google::Auth::Credentials
              SCOPE = ["https://www.googleapis.com/auth/adwords"].freeze
              PATH_ENV_VARS = ["GOOGLEADS_CREDENTIALS", "GOOGLEADS_KEYFILE"].freeze
              JSON_ENV_VARS = ["GOOGLEADS_CREDENTIALS_JSON", "GOOGLEADS_KEYFILE_JSON"].freeze
              DEFAULT_PATHS = [].freeze
            end
          end
        end
      end
    end
  end
end
