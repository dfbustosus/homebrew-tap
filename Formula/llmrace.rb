class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.4.0/llmrace-v1.4.0-aarch64-apple-darwin.tar.gz"
  version "1.4.0"
  sha256 "7618baff1b393640d71e388929890f708603dd26a8eccf4535baeb086db33f61"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.4.0/llmrace-v1.4.0-x86_64-apple-darwin.tar.gz"
    sha256 "c462918ef62f36a8c394fa72f4ad3bb4832ea8682808c358dbf59d5a7c7817c2"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.4.0/llmrace-v1.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a37fdd00962291a55edb6a2fe2e273d820946253dbaa6210e91d797bbc860e46"
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
