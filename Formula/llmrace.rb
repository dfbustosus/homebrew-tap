class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.5.1/llmrace-v1.5.1-aarch64-apple-darwin.tar.gz"
  version "1.5.1"
  sha256 "d509e6be46be0609b7c6af7c6248ec84edc7f0f9d98f6e469b59d9081de2a647"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.5.1/llmrace-v1.5.1-x86_64-apple-darwin.tar.gz"
    sha256 "c700e0dede832b4f885778a1db0adcde7c63a0fbeeb130e1219ff27c4bef7992"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.5.1/llmrace-v1.5.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e188abe3c89892e492cec30b72840f254d855d52b2a1f3414c48629d4bbb73c4"
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
