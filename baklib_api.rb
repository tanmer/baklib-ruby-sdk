# frozen_string_literal: true

require 'faraday'
require 'json'
class BaklibAPI
  attr_reader :token, :host
  def initialize(token, host)
    @token = token
    @host = host
  end

  def client
    @client ||= Faraday.new(url: host) do |conn|
      conn.headers['Authorization'] = "Bearer #{token}"
      conn.headers['Content-Type'] = 'application/json'
      conn.headers['User-Agent'] = 'Baklib API Client'
      conn.response :logger
      conn.adapter :net_http
    end
  end

  #站点
  def create_tenant(params = {})
    post("/api/v1/tenants", params)
  end

  def update_tenant(id, params = {})
    put("/api/v1/tenants/#{id}", params)
  end

  def list_tenants(params = {})
    get("/api/v1/tenants", params)
  end

  def show_tenant(id)
    get("/api/v1/tenants/#{id}")
  end

  def destroy_tenant(id)
    delete("/api/v1/tenants/#{id}")
  end

  # 栏目
  def create_channel(params = {})
    post("/api/v1/channels", params)
  end

  def update_channel(id, params = {})
    put("/api/v1/channels/#{id}", params)
  end

  def list_channels(params = {})
    get("/api/v1/channels", params)
  end

  def show_channel(id, params = {})
    get("/api/v1/channels/#{id}", params)
  end

  def destroy_channel(id, params = {})
    delete("/api/v1/channels/#{id}", params)
  end

  # 文章
  def create_article(params = {})
    post("/api/v1/articles", params)
  end

  def update_article(id, params = {})
    put("/api/v1/articles/#{id}", params)
  end

  def list_articles(params = {})
    get("/api/v1/articles", params)
  end

  def show_article(id, params = {})
    get("/api/v1/articles/#{id}", params)
  end

  def destroy_article(id, params = {})
    delete("/api/v1/articles/#{id}", params)
  end

  # 其他
  def list_global_layouts
    get("/api/v1/global_layouts/tenants")
  end

  def list_user_tenants
    get("/api/v1/user/tenants")
  end

  private

  def get(path, params = {})
    response = client.get(path, params)
    JSON.parse(response.body)
  end

  def post(path, params = {})
    response = client.post(path, params.to_json)
    JSON.parse(response.body)
  end

  def put(path, params = {})
    response = client.put(path, params.to_json)
    JSON.parse(response.body)
  end

  def delete(path, params = {})
    response = client.delete(path, params)
    JSON.parse(response.body)
  end
end
