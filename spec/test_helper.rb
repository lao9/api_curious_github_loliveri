def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: 'github',
    uid: '1234',
    extra: {
      raw_info: {
        name: "Lauren Oliveri",
        login: "lolly",
        email: "lauren@example.com",
        avatar_url: "https://avatars1.githubusercontent.com/u/4068853?v=3"
      }
    },
    credentials: {
      token: "kitty",
      secret: "secretkitty"
    }
  })
end

def stub_star_repos
  [
    stub_repository,
    stub_repository
  ]
end

def stub_github_user_collection
  [
    stub_github_user,
    stub_github_user,
    stub_github_user
  ]
end

def stub_repository
  {
    full_name: "lao9/black-thursday-project",
    owner: {
      login: "lao9",
      avatar_url: "https://avatars1.githubusercontent.com/u/4068853?v=3",
      url: "https://api.github.com/users/lao9",
    },
    created_at: "2017-02-21T20:27:50Z",
    updated_at: DateTime.yesterday.strftime("%Y-%m-%dT%H:%M:%S"),
    language: "Ruby"
  }
end

def stub_github_user
  {
    login: "maxjacobson",
    avatar_url: "https://avatars2.githubusercontent.com/u/1421211?v=3"
  }
end
