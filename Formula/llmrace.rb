class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v0.2.0/llmrace-v0.2.0-aarch64-apple-darwin.tar.gz"
  version "0.2.0"
  sha256 "815ed015b4442277967d4ec25f20c4648c29146255fe5f0c69d5b228fa0ad0ab"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.2.0/llmrace-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "17aa324ce1981bc83d3067f26742d409cb24bd9d092f2092364bbb72a310f5ec"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.2.0/llmrace-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4f248e3bd8af78b91199e966675caaf8f3bd897d81e46a9696c35d3c897e5a29"
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
