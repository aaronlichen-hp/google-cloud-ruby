# frozen_string_literal: true

# Copyright 2020 Google LLC
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

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/monitoring/v3/service_service_pb"
require "google/monitoring/v3/service_service_services_pb"
require "google/cloud/monitoring/v3/service_monitoring_service"

class Google::Cloud::Monitoring::V3::ServiceMonitoringService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_create_service
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::Service.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    service_id = "hello world"
    service = {}

    create_service_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_service, name
      assert_kind_of Google::Cloud::Monitoring::V3::CreateServiceRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.service_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Monitoring::V3::Service), request.service
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_service_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::ServiceMonitoringService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_service({ parent: parent, service_id: service_id, service: service }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_service parent: parent, service_id: service_id, service: service do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_service Google::Cloud::Monitoring::V3::CreateServiceRequest.new(parent: parent, service_id: service_id, service: service) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_service({ parent: parent, service_id: service_id, service: service }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_service Google::Cloud::Monitoring::V3::CreateServiceRequest.new(parent: parent, service_id: service_id, service: service), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_service_client_stub.call_rpc_count
    end
  end

  def test_get_service
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::Service.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_service_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_service, name
      assert_kind_of Google::Cloud::Monitoring::V3::GetServiceRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_service_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::ServiceMonitoringService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_service({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_service name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_service Google::Cloud::Monitoring::V3::GetServiceRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_service({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_service Google::Cloud::Monitoring::V3::GetServiceRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_service_client_stub.call_rpc_count
    end
  end

  def test_list_services
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::ListServicesResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    filter = "hello world"
    page_size = 42
    page_token = "hello world"

    list_services_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_services, name
      assert_kind_of Google::Cloud::Monitoring::V3::ListServicesRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.filter
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_services_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::ServiceMonitoringService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_services({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_services parent: parent, filter: filter, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_services Google::Cloud::Monitoring::V3::ListServicesRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_services({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_services Google::Cloud::Monitoring::V3::ListServicesRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_services_client_stub.call_rpc_count
    end
  end

  def test_update_service
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::Service.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    service = {}
    update_mask = {}

    update_service_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_service, name
      assert_kind_of Google::Cloud::Monitoring::V3::UpdateServiceRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Monitoring::V3::Service), request.service
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_service_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::ServiceMonitoringService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_service({ service: service, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_service service: service, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_service Google::Cloud::Monitoring::V3::UpdateServiceRequest.new(service: service, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_service({ service: service, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_service Google::Cloud::Monitoring::V3::UpdateServiceRequest.new(service: service, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_service_client_stub.call_rpc_count
    end
  end

  def test_delete_service
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_service_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_service, name
      assert_kind_of Google::Cloud::Monitoring::V3::DeleteServiceRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_service_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::ServiceMonitoringService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_service({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_service name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_service Google::Cloud::Monitoring::V3::DeleteServiceRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_service({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_service Google::Cloud::Monitoring::V3::DeleteServiceRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_service_client_stub.call_rpc_count
    end
  end

  def test_create_service_level_objective
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::ServiceLevelObjective.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    service_level_objective_id = "hello world"
    service_level_objective = {}

    create_service_level_objective_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_service_level_objective, name
      assert_kind_of Google::Cloud::Monitoring::V3::CreateServiceLevelObjectiveRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.service_level_objective_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Monitoring::V3::ServiceLevelObjective), request.service_level_objective
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_service_level_objective_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::ServiceMonitoringService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_service_level_objective({ parent: parent, service_level_objective_id: service_level_objective_id, service_level_objective: service_level_objective }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_service_level_objective parent: parent, service_level_objective_id: service_level_objective_id, service_level_objective: service_level_objective do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_service_level_objective Google::Cloud::Monitoring::V3::CreateServiceLevelObjectiveRequest.new(parent: parent, service_level_objective_id: service_level_objective_id, service_level_objective: service_level_objective) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_service_level_objective({ parent: parent, service_level_objective_id: service_level_objective_id, service_level_objective: service_level_objective }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_service_level_objective Google::Cloud::Monitoring::V3::CreateServiceLevelObjectiveRequest.new(parent: parent, service_level_objective_id: service_level_objective_id, service_level_objective: service_level_objective), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_service_level_objective_client_stub.call_rpc_count
    end
  end

  def test_get_service_level_objective
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::ServiceLevelObjective.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    view = :VIEW_UNSPECIFIED

    get_service_level_objective_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_service_level_objective, name
      assert_kind_of Google::Cloud::Monitoring::V3::GetServiceLevelObjectiveRequest, request
      assert_equal "hello world", request.name
      assert_equal :VIEW_UNSPECIFIED, request.view
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_service_level_objective_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::ServiceMonitoringService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_service_level_objective({ name: name, view: view }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_service_level_objective name: name, view: view do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_service_level_objective Google::Cloud::Monitoring::V3::GetServiceLevelObjectiveRequest.new(name: name, view: view) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_service_level_objective({ name: name, view: view }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_service_level_objective Google::Cloud::Monitoring::V3::GetServiceLevelObjectiveRequest.new(name: name, view: view), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_service_level_objective_client_stub.call_rpc_count
    end
  end

  def test_list_service_level_objectives
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::ListServiceLevelObjectivesResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    filter = "hello world"
    page_size = 42
    page_token = "hello world"
    view = :VIEW_UNSPECIFIED

    list_service_level_objectives_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_service_level_objectives, name
      assert_kind_of Google::Cloud::Monitoring::V3::ListServiceLevelObjectivesRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.filter
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      assert_equal :VIEW_UNSPECIFIED, request.view
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_service_level_objectives_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::ServiceMonitoringService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_service_level_objectives({ parent: parent, filter: filter, page_size: page_size, page_token: page_token, view: view }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_service_level_objectives parent: parent, filter: filter, page_size: page_size, page_token: page_token, view: view do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_service_level_objectives Google::Cloud::Monitoring::V3::ListServiceLevelObjectivesRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token, view: view) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_service_level_objectives({ parent: parent, filter: filter, page_size: page_size, page_token: page_token, view: view }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_service_level_objectives Google::Cloud::Monitoring::V3::ListServiceLevelObjectivesRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token, view: view), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_service_level_objectives_client_stub.call_rpc_count
    end
  end

  def test_update_service_level_objective
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::ServiceLevelObjective.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    service_level_objective = {}
    update_mask = {}

    update_service_level_objective_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_service_level_objective, name
      assert_kind_of Google::Cloud::Monitoring::V3::UpdateServiceLevelObjectiveRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Monitoring::V3::ServiceLevelObjective), request.service_level_objective
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_service_level_objective_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::ServiceMonitoringService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_service_level_objective({ service_level_objective: service_level_objective, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_service_level_objective service_level_objective: service_level_objective, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_service_level_objective Google::Cloud::Monitoring::V3::UpdateServiceLevelObjectiveRequest.new(service_level_objective: service_level_objective, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_service_level_objective({ service_level_objective: service_level_objective, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_service_level_objective Google::Cloud::Monitoring::V3::UpdateServiceLevelObjectiveRequest.new(service_level_objective: service_level_objective, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_service_level_objective_client_stub.call_rpc_count
    end
  end

  def test_delete_service_level_objective
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_service_level_objective_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_service_level_objective, name
      assert_kind_of Google::Cloud::Monitoring::V3::DeleteServiceLevelObjectiveRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_service_level_objective_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::ServiceMonitoringService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_service_level_objective({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_service_level_objective name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_service_level_objective Google::Cloud::Monitoring::V3::DeleteServiceLevelObjectiveRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_service_level_objective({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_service_level_objective Google::Cloud::Monitoring::V3::DeleteServiceLevelObjectiveRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_service_level_objective_client_stub.call_rpc_count
    end
  end
end
