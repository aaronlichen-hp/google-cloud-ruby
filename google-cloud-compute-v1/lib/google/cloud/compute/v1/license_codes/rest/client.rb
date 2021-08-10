# frozen_string_literal: true

# Copyright 2021 Google LLC
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

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "google/cloud/compute/v1/compute_pb"
require "google/cloud/compute/v1/license_codes/rest/service_stub"

module Google
  module Cloud
    module Compute
      module V1
        module LicenseCodes
          module Rest
            ##
            # REST client for the LicenseCodes service.
            #
            # The LicenseCodes API.
            #
            class Client
              # @private
              attr_reader :license_codes_stub

              ##
              # Configure the LicenseCodes Client class.
              #
              # See {::Google::Cloud::Compute::V1::LicenseCodes::Rest::Client::Configuration}
              # for a description of the configuration fields.
              #
              # ## Example
              #
              # To modify the configuration for all LicenseCodes clients:
              #
              #     ::Google::Cloud::Compute::V1::LicenseCodes::Rest::Client.configure do |config|
              #       config.timeout = 10.0
              #     end
              #
              # @yield [config] Configure the Client client.
              # @yieldparam config [Client::Configuration]
              #
              # @return [Client::Configuration]
              #
              def self.configure
                @configure ||= begin
                  namespace = ["Google", "Cloud", "Compute", "V1"]
                  parent_config = while namespace.any?
                                    parent_name = namespace.join "::"
                                    parent_const = const_get parent_name
                                    break parent_const.configure if parent_const.respond_to? :configure
                                    namespace.pop
                                  end
                  default_config = Client::Configuration.new parent_config

                  default_config
                end
                yield @configure if block_given?
                @configure
              end

              ##
              # Configure the LicenseCodes Client instance.
              #
              # The configuration is set to the derived mode, meaning that values can be changed,
              # but structural changes (adding new fields, etc.) are not allowed. Structural changes
              # should be made on {Client.configure}.
              #
              # See {::Google::Cloud::Compute::V1::LicenseCodes::Rest::Client::Configuration}
              # for a description of the configuration fields.
              #
              # @yield [config] Configure the Client client.
              # @yieldparam config [Client::Configuration]
              #
              # @return [Client::Configuration]
              #
              def configure
                yield @config if block_given?
                @config
              end

              ##
              # Create a new LicenseCodes REST client object.
              #
              # ## Examples
              #
              # To create a new LicenseCodes REST client with the default
              # configuration:
              #
              #     client = ::Google::Cloud::Compute::V1::LicenseCodes::Rest::Client.new
              #
              # To create a new LicenseCodes REST client with a custom
              # configuration:
              #
              #     client = ::Google::Cloud::Compute::V1::LicenseCodes::Rest::Client.new do |config|
              #       config.timeout = 10.0
              #     end
              #
              # @yield [config] Configure the LicenseCodes client.
              # @yieldparam config [Client::Configuration]
              #
              def initialize
                # Create the configuration object
                @config = Configuration.new Client.configure

                # Yield the configuration if needed
                yield @config if block_given?

                # Create credentials
                credentials = @config.credentials
                credentials ||= Credentials.default scope: @config.scope
                if credentials.is_a?(::String) || credentials.is_a?(::Hash)
                  credentials = Credentials.new credentials, scope: @config.scope
                end

                @license_codes_stub = ::Google::Cloud::Compute::V1::LicenseCodes::Rest::ServiceStub.new endpoint: @config.endpoint, credentials: credentials
              end

              # Service calls

              ##
              # Return a specified license code. License codes are mirrored across all projects that have permissions to read the License Code.  Caution This resource is intended for use only by third-party partners who are creating Cloud Marketplace images.
              #
              # @overload get(request, options = nil)
              #   Pass arguments to `get` via a request object, either of type
              #   {::Google::Cloud::Compute::V1::GetLicenseCodeRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Compute::V1::GetLicenseCodeRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #     Note: currently retry functionality is not implemented. While it is possible
              #     to set it using ::Gapic::CallOptions, it will not be applied
              #
              # @overload get(license_code: nil, project: nil)
              #   Pass arguments to `get` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param license_code [::String]
              #     Number corresponding to the License code resource to return.
              #   @param project [::String]
              #     Project ID for this request.
              # @yield [result, response] Access the result along with the Faraday response object
              # @yieldparam result [::Google::Cloud::Compute::V1::LicenseCode]
              # @yieldparam response [::Faraday::Response]
              #
              # @return [::Google::Cloud::Compute::V1::LicenseCode]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              def get request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Compute::V1::GetLicenseCodeRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = {}

                # Set x-goog-api-client header
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Compute::V1::VERSION,
                  transports_version_send: [:rest]

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     call_metadata

                @license_codes_stub.get request, options do |result, response|
                  yield result, response if block_given?
                  return result
                end
              rescue ::Faraday::Error => e
                gapic_error = ::Gapic::Rest::Error.wrap_faraday_error e
                raise ::Google::Cloud::Error.from_error(gapic_error)
              end

              ##
              # Returns permissions that a caller has on the specified resource.  Caution This resource is intended for use only by third-party partners who are creating Cloud Marketplace images.
              #
              # @overload test_iam_permissions(request, options = nil)
              #   Pass arguments to `test_iam_permissions` via a request object, either of type
              #   {::Google::Cloud::Compute::V1::TestIamPermissionsLicenseCodeRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Compute::V1::TestIamPermissionsLicenseCodeRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #     Note: currently retry functionality is not implemented. While it is possible
              #     to set it using ::Gapic::CallOptions, it will not be applied
              #
              # @overload test_iam_permissions(project: nil, resource: nil, test_permissions_request_resource: nil)
              #   Pass arguments to `test_iam_permissions` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param project [::String]
              #     Project ID for this request.
              #   @param resource [::String]
              #     Name or id of the resource for this request.
              #   @param test_permissions_request_resource [::Google::Cloud::Compute::V1::TestPermissionsRequest, ::Hash]
              #     The body resource for this request
              # @yield [result, response] Access the result along with the Faraday response object
              # @yieldparam result [::Google::Cloud::Compute::V1::TestPermissionsResponse]
              # @yieldparam response [::Faraday::Response]
              #
              # @return [::Google::Cloud::Compute::V1::TestPermissionsResponse]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              def test_iam_permissions request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Compute::V1::TestIamPermissionsLicenseCodeRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = {}

                # Set x-goog-api-client header
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Compute::V1::VERSION,
                  transports_version_send: [:rest]

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     call_metadata

                @license_codes_stub.test_iam_permissions request, options do |result, response|
                  yield result, response if block_given?
                  return result
                end
              rescue ::Faraday::Error => e
                gapic_error = ::Gapic::Rest::Error.wrap_faraday_error e
                raise ::Google::Cloud::Error.from_error(gapic_error)
              end

              ##
              # Configuration class for the LicenseCodes REST API.
              #
              # This class represents the configuration for LicenseCodes REST,
              # providing control over credentials, timeouts, retry behavior, logging.
              #
              # Configuration can be applied globally to all clients, or to a single client
              # on construction.
              #
              # # Examples
              #
              # To modify the global config, setting the timeout for all calls to 10 seconds:
              #
              #     ::Google::Cloud::Compute::V1::LicenseCodes::Client.configure do |config|
              #       config.timeout = 10.0
              #     end
              #
              # To apply the above configuration only to a new client:
              #
              #     client = ::Google::Cloud::Compute::V1::LicenseCodes::Client.new do |config|
              #       config.timeout = 10.0
              #     end
              #
              # @!attribute [rw] endpoint
              #   The hostname or hostname:port of the service endpoint.
              #   Defaults to `"compute.googleapis.com"`.
              #   @return [::String]
              # @!attribute [rw] credentials
              #   Credentials to send with calls. You may provide any of the following types:
              #    *  (`String`) The path to a service account key file in JSON format
              #    *  (`Hash`) A service account key as a Hash
              #    *  (`Google::Auth::Credentials`) A googleauth credentials object
              #       (see the [googleauth docs](https://googleapis.dev/ruby/googleauth/latest/index.html))
              #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
              #       (see the [signet docs](https://googleapis.dev/ruby/signet/latest/Signet/OAuth2/Client.html))
              #    *  (`nil`) indicating no credentials
              #   @return [::Object]
              # @!attribute [rw] scope
              #   The OAuth scopes
              #   @return [::Array<::String>]
              # @!attribute [rw] lib_name
              #   The library name as recorded in instrumentation and logging
              #   @return [::String]
              # @!attribute [rw] lib_version
              #   The library version as recorded in instrumentation and logging
              #   @return [::String]
              # @!attribute [rw] timeout
              #   The call timeout in seconds.
              #   @return [::Numeric]
              #
              class Configuration
                extend ::Gapic::Config

                config_attr :endpoint,      "compute.googleapis.com", ::String
                config_attr :credentials,   nil do |value|
                  allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                  allowed.any? { |klass| klass === value }
                end
                config_attr :scope,         nil, ::String, ::Array, nil
                config_attr :lib_name,      nil, ::String, nil
                config_attr :lib_version,   nil, ::String, nil
                config_attr :timeout,       nil, ::Numeric, nil

                # @private
                def initialize parent_config = nil
                  @parent_config = parent_config unless parent_config.nil?

                  yield self if block_given?
                end
              end
            end
          end
        end
      end
    end
  end
end
