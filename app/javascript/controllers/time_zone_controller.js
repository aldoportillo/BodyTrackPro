document.addEventListener('turbo:load', () => {
    const timeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;
    fetch('/set_user_time_zone', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: `time_zone=${encodeURIComponent(timeZone)}`
    });
  });
  