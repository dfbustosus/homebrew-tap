class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.6.0/llmrace-v1.6.0-aarch64-apple-darwin.tar.gz"
  version "1.6.0"
  sha256 "0e5792340d2c89a4bf7efffcf4872b1730934bc72d599926bfedfd75fa32e5fb"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.6.0/llmrace-v1.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "4117b3562a46c3d7834131ab6af256f654b20decf720cd8423e783ccb87af127"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.6.0/llmrace-v1.6.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6d268d2f1f98812a47e4cd00d34324e8242da4159c040249f39c5b53d80c7801"
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
