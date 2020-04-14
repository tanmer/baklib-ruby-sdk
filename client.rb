# frozen_string_literal: true

require_relative './baklib_api'
require_relative './config'
require 'pp'


# 本教程中所有id及token均为虚拟值，需要替换为真实的token值
 client = BaklibAPI.new(Config::TOKEN, Config::HOST)

# --------------- 部分参数介绍 ------------------------
 # 站点id
 tenant_id = 'tenant_id'
 # 栏目id
 channel_id = 'channel_id'
 #文章id
 article_id = 'article_id'
 # 主题id
 global_layout_id = 'global_layout_id'
 # 需要移动到父级栏目的id
 parent_id = 'parent_id'

# --------------- 站点api调用 ------------------------
# 创建站点
create_tenant_params = {
  name: 'baklib API 文档说明(测试)',
  global_layout_id: global_layout_id,
  identifier: 'BaklibApiDocTest',
  icp_info: '蜀ICP备15035023号 - 13'
}
pp client.create_tenant(create_tenant_params)

# 列出站点列表
list_tenants_params = {
  _page: 1,
  _per_page: 2
}
pp client.list_tenants(list_tenants_params)

# 更新站点信息
update_tenant_params = {
  name: '接口开发文档说明',
  global_layout_id: global_layout_id,
  identifier: 'BaklibApiDoc',
  icp_info: '蜀ICP备15035023号 - 13'
}
pp client.update_tenant(tenant_id, update_tenant_params)

# 删除站点
pp client.destroy_tenant(tenant_id)

# 获取站点详情
pp client.show_tenant(tenant_id)

# --------------- 栏目api调用 ------------------------
# 创建站点栏目
create_channel_params = {
  tenant_id: tenant_id,
  name: 'ruby on rails note',
  parent_id: parent_id,
}
pp client.create_channel(create_channel_params)

# 删除站点栏目
destroy_channel_params = {
  tenant_id: tenant_id
}
pp client.destroy_channel(channel_id, destroy_channel_params)

# 更新站点栏目
update_channel_params = {
  tenant_id: tenant_id,
  name: 'rails guide',
  description: '本文介绍如何开始使用 Ruby on Rails。'
}
pp client.update_channel(channel_id, update_channel_params)

# 列出站点栏目列表
list_channels_params = {
  tenant_id: tenant_id,
  parent_id: parent_id
}
pp client.list_channels(list_channels_params)

# 列出栏目详情信息
show_channel_params = {
  tenant_id: tenant_id
}
pp client.show_channel(channel_id, show_channel_params)

# --------------- 文章api调用 ------------------------

# 创建文章
create_article_params = {
  tenant_id: tenant_id,
  name: 'Ruby的历史',
  channel_id: channel_id,
  tag_list: ['Ruby', 'Ruby历史'],
  status: 0
}
pp client.create_article(create_article_params)

# 更新文章
update_article_params = {
  tenant_id: tenant_id,
  name: 'rails guide',
  channel_id: channel_id,
  tag_list: ['rails', 'doc'],
  description: '本文介绍如何开始使用 Ruby on Rails。',
  status: 0
}
pp client.update_article(article_id, update_article_params)

# 列出文章列表
list_articles_params = {
  tenant_id: tenant_id,
  channel_id: channel_id,
  _page: 1,
  _per_page: 2
}
pp client.list_articles(list_articles_params)

# 列出文章详情信息
show_article_params = {
  tenant_id: tenant_id
}
pp client.show_article(article_id, show_article_params)

# 删除文章
destroy_article_params = {
  tenant_id: tenant_id
}
pp client.destroy_article(article_id, destroy_article_params)

# --------------- 其他api调用 ------------------------

# 获取站点所有可用主题
pp client.list_global_layouts

# 获取用户相关站点
pp client.list_user_tenants
