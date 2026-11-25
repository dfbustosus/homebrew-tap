class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.35.0/llmrace-v1.35.0-aarch64-apple-darwin.tar.gz"
  version "1.35.0"
  sha256 "a1309882f80b422e33033c16fe543d962f5e6f5026fd04f2ca08d762dfb14e2d"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.35.0/llmrace-v1.35.0-x86_64-apple-darwin.tar.gz"
    sha256 "960b2b2f2cf9d80f28a67fb447feda95b8cdb0bdbabf47b14d63ddba3ff5c3a9"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.35.0/llmrace-v1.35.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e360c049f838b5361af82ba141b5edd3e3ba8e338e7664f3ce5227cba4a6d2ee"
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
