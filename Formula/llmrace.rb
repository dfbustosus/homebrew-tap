class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.1.1/llmrace-v1.1.1-aarch64-apple-darwin.tar.gz"
  version "1.1.1"
  sha256 "959ba564d54a365f625a7c422540ab11bf3dcd2e3fcc5224a329de37cf59158c"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.1.1/llmrace-v1.1.1-x86_64-apple-darwin.tar.gz"
    sha256 "7b8e651fa4f1bb18c57c8a268c39e5cdb2e191adc312a119ebf237616cd26ed7"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.1.1/llmrace-v1.1.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9b91f496cded6f4960642cebe014fef090900428a4fe1000c18274153de7f162"
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
