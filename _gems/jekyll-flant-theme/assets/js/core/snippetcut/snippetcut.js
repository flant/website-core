document.addEventListener('DOMContentLoaded', () => {
    const copyFileName = document.querySelectorAll('[data-snippetcut-btn-name]');
    const copyFileText = document.querySelectorAll('[data-snippetcut-btn-text]');

    for (const btnFileName of copyFileName) {
        btnHandler(btnFileName, '[data-snippetcut-name]')
    }

    for (const btnFileText of copyFileText) {
        btnHandler(btnFileText, '[data-snippetcut-text]');
    }
})

function btnHandler(button, selector) {
    button.addEventListener('click', (e) => {
        e.preventDefault();
        const parent = e.target.closest('.snippetcut');
        const text = parent.querySelector(selector).innerText;
        const oldText = button.innerText;
        const lang = document.documentElement.lang;

        navigator.clipboard.writeText(`${text}`)
            .then(() => {
                // Успех!
                if (selector === '[data-snippetcut-text]') {
                    button.innerHTML = dataGlobalI18n.snippetcut.messages.content_copied[lang];
                } else {
                    button.innerHTML = dataGlobalI18n.snippetcut.messages.filename_copied[lang];
                }
                button.classList.add('button__success');

                setTimeout(()=> {
                    button.innerHTML = oldText;
                    button.classList.remove('button__success');
                }, 2000);
            })
            .catch(() => {
                // Неудача :(
                button.innerHTML = dataGlobalI18n.snippetcut.messages.something_went_wrong[lang];
                button.classList.add('button__danger');

                setTimeout(()=> {
                    button.innerHTML = oldText;
                    button.classList.remove('button__danger');
                }, 2000);
            });
    });
}