const $siteList = $(".siteList");
const $lastLi = $siteList.find("li.last");
const x = localStorage.getItem("x");
const xObject = JSON.parse(x);
const hasMap = xObject || [
  {
    logo: "A",
    logoType: "text",
    url: "https://www.acfun.cn",
  },
  {
    logo: "B",
    logoType: "image",
    url: "https://www.bilibili.com",
  },
];

const removeX = (url) => {
  return url.replace("http://", "").replace("https://", "").replace("www.", "");
};

const render = () => {
  $siteList.find("li:not(.last)").remove();
  hasMap.forEach((node) => {
    const $li = $(`<li>
    <a href="${node.url}">
            <div class="site">
              <div class="logo">${node.logo}</div>
              <div class="link">${removeX(node.url)}</div>
            </div>
          </a>
  </li>`).insertBefore($lastLi);
  });
};

render();

$(".addButton").on("click", () => {
  let url = window.prompt("请问你要添加的网站");
  if (url.indexOf("http") !== 0) {
    url = "https://" + url;
  }
  console.log(url);
  hasMap.push({
    logo: url[0],
    logoType: "Text",
    url: url,
  });
  render();
});

window.onbeforeunload = () => {
  const string = JSON.stringify(hasMap);
  localStorage.setItem("x", string);
};
