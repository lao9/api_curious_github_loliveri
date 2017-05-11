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
    description: "Turing School promotion portfolios",
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

def stub_user_profile
  stub_omniauth

  allow_any_instance_of(GithubService)
    .to receive(:starred_repos)
    .and_return(stub_star_repos)

  allow_any_instance_of(GithubService)
    .to receive(:followers)
    .and_return(stub_github_user_collection)

  allow_any_instance_of(GithubService)
    .to receive(:followings)
    .and_return(stub_github_user_collection)

  allow_any_instance_of(GithubService)
    .to receive(:repos)
    .and_return(stub_repo_list)

  allow_any_instance_of(GithubService)
    .to receive(:orgs)
    .and_return(stub_organizations)
end

def stub_organizations
  [
    {
      login: "Duke-Medical-Instrumentation",
      id: 5090472,
      avatar_url: "https://avatars2.githubusercontent.com/u/5090472?v=3",
      description: nil
    }
  ]
end

def stub_repo_list
  [
  {
    id: 1,
    full_name: "lao9/homework",
    owner: {
      login: "lao9",
    },
    description: nil,
    created_at: "2017-01-23T23:35:23Z",
    updated_at: "2017-01-25T16:12:01Z",
    language: "Ruby"
  },
  {
    id: 2,
    full_name: "lao9/http_yeah_you_know_me",
    owner: {
      login: "lao9",
    },
    description: nil,
    created_at: "2017-02-13T22:53:52Z",
    updated_at: "2017-02-13T22:54:33Z",
    language: "Ruby"
  },
  {
    id: 3,
    full_name: "lao9/intro-to-ar",
    owner: {
      login: "lao9",
    },
    description: nil,
    created_at: "2017-03-15T17:26:32Z",
    updated_at: "2017-03-15T17:26:34Z",
    language: "Ruby"
  },
  {
    id: 4,
    full_name: "lao9/job-tracker",
    owner: {
      login: "lao9",
    },
    description: nil,
    created_at: "2017-03-30T19:24:32Z",
    updated_at: "2017-03-30T19:24:34Z",
    language: "Ruby"
  },
  {
    id: 5,
    full_name: "lao9/knight_rider",
    owner: {
      login: "lao9",
    },
    description: nil,
    created_at: "2017-02-28T16:20:09Z",
    updated_at: "2017-02-28T16:01:44Z",
    language: nil
  },
  {
    id: 6,
    full_name: "lao9/lao9.github.io",
    owner: {
      login: "lao9",
    },
    description: nil,
    created_at: "2017-03-10T19:58:57Z",
    updated_at: "2017-04-20T04:29:42Z",
    language: "HTML"
  },
  {
    id: 7,
    full_name: "lao9/league-manager",
    owner: {
      login: "lao9",
    },
    description: nil,
    created_at: "2017-04-06T17:21:44Z",
    updated_at: "2017-04-06T17:21:46Z",
    language: "Ruby"
  },
  {
    id: 8,
    full_name: "lao9/mix_master",
    owner: {
      login: "lao9",
    },
    description: nil,
    created_at: "2017-03-30T06:20:17Z",
    updated_at: "2017-03-30T06:20:18Z",
    language: "Ruby"
  },
  {
    id: 9,
    full_name: "lao9/night_writer",
    owner: {
      login: "lao9",
    },
    description: nil,
    created_at: "2017-02-03T18:52:55Z",
    updated_at: "2017-02-03T18:53:39Z",
    language: "Ruby"
  },
  {
    id: 10,
    full_name: "lao9/pizza-customer",
    owner: {
      login: "lao9",
    },
    description: nil,
    created_at: "2017-02-24T20:16:25Z",
    updated_at: "2017-02-24T20:16:26Z",
    language: "Ruby",
  },
  {
    id: 11,
    full_name: "lao9/portfolios",
    owner: {
      login: "lao9",
    },
    description: "Turing School promotion portfolios",
    created_at: "2017-02-01T17:04:15Z",
    updated_at: "2017-02-01T17:04:22Z",
    language: "HTML"
  }
]
end
