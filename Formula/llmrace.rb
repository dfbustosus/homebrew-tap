class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v0.4.0/llmrace-v0.4.0-aarch64-apple-darwin.tar.gz"
  version "0.4.0"
  sha256 "001a68b2990f643c143eed8c78dc3a783898cfb9b05660668c61e24261216474"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.4.0/llmrace-v0.4.0-x86_64-apple-darwin.tar.gz"
    sha256 "45b262377b02665ef986be347b084a89e5dcfe425aa88edab4ed0cde1e05afd8"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.4.0/llmrace-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ce50b08812943bc839bc443264865a7f8968ec27f7fdeed2f15d6a830e199a10"
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
