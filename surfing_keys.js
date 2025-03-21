// remove baidu, bing and duckduckgo
["b", "w", "d"].map((s) => api.removeSearchAlias(s));

wpDefaultIcon =
  "data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22utf-8%22%3F%3E%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2056%2056%22%20enable-background%3D%22new%200%200%2056%2056%22%3E%0A%20%20%20%20%3Cpath%20fill%3D%22%23eee%22%20d%3D%22M0%200h56v56h-56z%22%2F%3E%0A%20%20%20%20%3Cpath%20fill%3D%22%23999%22%20d%3D%22M36.4%2013.5h-18.6v24.9c0%201.4.9%202.3%202.3%202.3h18.7v-25c.1-1.4-1-2.2-2.4-2.2zm-6.2%203.5h5.1v6.4h-5.1v-6.4zm-8.8%200h6v1.8h-6v-1.8zm0%204.6h6v1.8h-6v-1.8zm0%2015.5v-1.8h13.8v1.8h-13.8zm13.8-4.5h-13.8v-1.8h13.8v1.8zm0-4.7h-13.8v-1.8h13.8v1.8z%22%2F%3E%0A%3C%2Fsvg%3E%0A";

function parseSuggestions(response) {
  return JSON.parse(response.text).map((r) => {
    const u = new URL("https://kagi.com/search");
    u.searchParams.append("q", r.t);
    if (r.goto) {
      u.href = r.goto;
    }
    return {
      url: u.href,
      html: `
      <div style="padding: 5px; display: grid; grid-template-columns: 32px 1fr; grid-gap: 15px">
        <img style="width: 32px" src="${
          r.img ? new URL(r.img, "https://kagi.com") : wpDefaultIcon
        }" />
        <div>
          <div class="title"><strong>${r.t}</strong></div>
          <div class="title">${r.txt ?? ""}</div>
        </div>
      </div>
    `,
    };
  });
}

api.addSearchAlias(
  "k",
  "kagi",
  "https://kagi.com/search?q=",
  "s",
  "https://kagi.com/autosuggest?q=",
  parseSuggestions,
);

settings.defaultSearchEngine = "k";

function openSummary({ url = window.location.href } = {}) {
  const result = `https://kagi.com/summarizer/index.html?${new URLSearchParams({
    url,
  })}`;
  api.tabOpenLink(result);
}

api.mapkey("=s", "View summary for page", openSummary);



// Linear brings it's own very nice keyboard navigation
api.unmapAllExcept(["E", "R", "T", "ok"], /linear\.app\/\w+\/.+$/);

// Readwise also brings nice keyboard navigation (mostly)
api.unmapAllExcept(["E", "R", "T"], /read.readwise.io/);
