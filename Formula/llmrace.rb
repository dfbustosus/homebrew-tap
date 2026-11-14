class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.0.0/llmrace-v1.0.0-aarch64-apple-darwin.tar.gz"
  version "1.0.0"
  sha256 "bf7cb07e2a167133649ec12d878c6b8ea62ff93eb172dfffd4e4eee0f91b7581"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.0.0/llmrace-v1.0.0-x86_64-apple-darwin.tar.gz"
    sha256 "9c25acc36e79d3cb9d4c55caf0a91a872cd6434f552e621070f38d60faff7d7e"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.0.0/llmrace-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7f4f64f276100fc151d4799804d1752cb958f5ca76443862f393b45a3c7bedb1"
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
