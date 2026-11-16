class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.3.1/llmrace-v1.3.1-aarch64-apple-darwin.tar.gz"
  version "1.3.1"
  sha256 "ede4cdc2459a90c2f9abd380d54e22398cc3a48497ad4ea11e5fee21361e4e1e"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.3.1/llmrace-v1.3.1-x86_64-apple-darwin.tar.gz"
    sha256 "eb8969cb392f73aeecc3d6eceb9fe316afd3e7d13e8f540474a56f09b0e934d3"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.3.1/llmrace-v1.3.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9c2bd7bf786cd3ab9b1be3950495f8948d26da7bb52f927a67178e6c7c767ab2"
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
