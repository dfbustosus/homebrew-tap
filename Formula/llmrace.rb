class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v0.3.0/llmrace-v0.3.0-aarch64-apple-darwin.tar.gz"
  version "0.3.0"
  sha256 "6df71945803266569c2c47abaa8174b93b52f506cf10b82a3df1557388f23c4a"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.3.0/llmrace-v0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "daf47e0e50312a88b49fc981c1ac1ea820a491655e48e80134bd1daa42c4ff4b"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.3.0/llmrace-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9a01a23a644f7a51a407284eb4faf46695937d46073938c85808fef61ad1faac"
  end

  def install
    bin.install "bin/llmrace"
  end

  def caveats
    <<~EOS
      Providers are auto-detected from the environment:
      OPENAI_API_KEY, ANTHROPIC_API_KEY, GEMINI_API_KEY, GROQ_API_KEY,
      DEEPSEEK_API_KEY, MISTRAL_API_KEY, TOGETHER_API_KEY, FIREWORKS_API_KEY,
      CEREBRAS_API_KEY, OPENROUTER_API_KEY, or a local Ollama daemon.
    EOS
  end

  test do
    assert_match "llmrace", shell_output("#{bin}/llmrace --version")
  end
end
