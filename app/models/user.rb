require_relative '../services/github_service'

class User < ApplicationRecord
  validates :uid, :username, :name, :email, :image_url, presence: true

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.username           = auth_info.extra.raw_info.login
      new_user.name               = auth_info.extra.raw_info.name
      new_user.email              = auth_info.extra.raw_info.email
      new_user.image_url          = auth_info.extra.raw_info.avatar_url
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  def starred_repos
    GithubService.starred_repos(username, {access_token: oauth_token}).map do |raw_repo|
      Repository.new(raw_repo)
    end
  end

  def followers
    GithubService.followers(username, {access_token: oauth_token}).map do |raw_user|
      GithubUser.new(raw_user)
    end
  end

  def followings
    GithubService.followings(username, {access_token: oauth_token}).map do |raw_user|
      GithubUser.new(raw_user)
    end
  end

  def repos
    GithubService.repos(username, {access_token: oauth_token}).map do |raw_repo|
      Repository.new(raw_repo)
    end
  end

  def orgs
    GithubService.orgs(username, {access_token: oauth_token}).map do |raw_org|
      Organization.new(raw_org)
    end
  end

end
