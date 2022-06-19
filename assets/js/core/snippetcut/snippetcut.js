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

        navigator.clipboard.writeText(`${text}`)
            .then(() => {
                // Успех!
                button.innerHTML = 'Text copied';
                button.style.cssText = 'border-color: #28a745; color: #28a745';

                setTimeout(()=> {
                    button.innerHTML = oldText;
                    button.removeAttribute('style');
                }, 2000);
            })
            .catch(() => {
                // Неудача :(
                button.innerHTML = 'Something went wrong';
                button.style.cssText = 'border-color: #dc3545; color: #dc3545';

                setTimeout(()=> {
                    button.innerHTML = oldText;
                    button.removeAttribute('style');
                }, 2000);
            });
    });
}