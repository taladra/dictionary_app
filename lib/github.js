// Express + Firebase Function
app.get("/auth/github", async (req, res) => {
  const code = req.query.code;
  const githubResponse = await axios.post(
    `https://github.com/login/oauth/access_token`,
    {
      client_id: GITHUB_CLIENT_ID,
      client_secret: GITHUB_CLIENT_SECRET,
      code: code,
    },
    { headers: { Accept: "application/json" } }
  );

  const accessToken = githubResponse.data.access_token;

  // Now get user info from GitHub
  const githubUser = await axios.get("https://api.github.com/user", {
    headers: { Authorization: `token ${accessToken}` },
  });

  // Create custom Firebase token
  const firebaseToken = await admin.auth().createCustomToken(githubUser.data.id.toString());

  res.json({ token: firebaseToken });
});
