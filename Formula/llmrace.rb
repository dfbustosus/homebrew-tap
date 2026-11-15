class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.2.0/llmrace-v1.2.0-aarch64-apple-darwin.tar.gz"
  version "1.2.0"
  sha256 "3d1c1928eb66706f2b5605f558d32b3c8d8f54067f39e6f5645f6c93a174f6d0"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.2.0/llmrace-v1.2.0-aarch64-apple-darwin.tar.gz"
  version "1.2.0"
  sha256 "959ba564d54a365f625a7c422540ab11bf3dcd2e3fcc5224a329de37cf59158c"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.2.0/llmrace-v1.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "eb9cfa5e838dddc1c6f4ed61b10a473d95d20adb75abbfb05914f1e411f8672c"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.2.0/llmrace-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "19111ff706b93967c077ec13ff0270ae4abb77330677a332c20f7a17adf9699a"
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
