class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.20.0/llmrace-v1.20.0-aarch64-apple-darwin.tar.gz"
  version "1.20.0"
  sha256 "be2987c3b7569773b7d136e5770cae5476b04a1a541dbdc8fd39ef88f999d85b"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.20.0/llmrace-v1.20.0-x86_64-apple-darwin.tar.gz"
    sha256 "e0197226cc2fb2bea1a7536622196862f4e4b712a51da0cd2044578481c17b1d"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.20.0/llmrace-v1.20.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fa5fdca97573d4c9d18fa58684d36e5444f914f1b764d90c5005879869bf9b57"
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
