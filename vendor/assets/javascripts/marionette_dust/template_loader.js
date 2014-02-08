function waitForTemplates() {
  if (typeof JST !== "undefined") {
    left = Object.keys(JST);

    while (left.length > 0) {
      left.forEach(function(key, idx) {
        try {
          JST[key]({}, function(out, err) {});
          left.splice(idx, 1);
        } catch (err) {
          console.log('failed', key, idx);
          left.splice(idx, 1);
        }
      });
    }

  } else {
    setTimeout(function() {
      waitForTemplates();
    }, 250);
  }
}

waitForTemplates();
