class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v0.6.0/llmrace-v0.6.0-aarch64-apple-darwin.tar.gz"
  version "0.6.0"
  sha256 "349b231af6fbe1a522752e89e62b92d264d28204078c745371702ccb99df36fd"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.6.0/llmrace-v0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "6e1e5bc813bc51d4e168e2aaa860a7aa94c61f2d3bd17614a4f1c8cb8d91eebe"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.6.0/llmrace-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0068d3d3356bdf76fe817c5c90d46699dda95828a6ef17a9d39ad55837fa8bdc"
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
