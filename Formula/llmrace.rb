class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.39.0/llmrace-v1.39.0-aarch64-apple-darwin.tar.gz"
  version "1.39.0"
  sha256 "ff2a86a8e921b96975bae81f77c5631fae1b5b9efaebe03abd6c220d5e57fae2"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.39.0/llmrace-v1.39.0-x86_64-apple-darwin.tar.gz"
    sha256 "cbac137ad44395eff209be9e8c2829010d188a322531cb8d9c145238046c0006"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.39.0/llmrace-v1.39.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "432862e9f77ff5dd78b921a2e98199ca8f432cd1d9302f57daeb3633e18f74a3"
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
