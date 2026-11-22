class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.24.0/llmrace-v1.24.0-aarch64-apple-darwin.tar.gz"
  version "1.24.0"
  sha256 "329c64ba37ca5cd51fecd49a0637ccf0011adb3a8b032a68ae9a0544d3cd5c17"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.24.0/llmrace-v1.24.0-x86_64-apple-darwin.tar.gz"
    sha256 "b8dfd19c285a7cf1b156f0279f759ad027d669de3cf67a961bd3a928309492e4"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.24.0/llmrace-v1.24.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d5d86443be44381e7f320d2594374dad9801d54ebef9fb71a1992a7e0e5eabd2"
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
