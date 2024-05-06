const fs = require('fs');

// Define our EngInterpreter object
const EngInterpreter = {
    // Variable to store user-defined variables
    variables: {},

    // Function to evaluate arithmetic expressions
    evaluateArithmetic: function(expression) {
        // Evaluate the arithmetic expression and return the result
        return eval(expression);
    },

    // Function to evaluate and execute Eng code
    evaluate: function(code) {
        // Split the code into individual lines
        const lines = code.split('\n');

        // Iterate over each line of code
        lines.forEach(line => {
            // Ignore empty lines
            if (line.trim() === '') return;

            // Remove quotes from strings
            line = line.replace(/"/g, '');

            // Check for "and" operator
            const andIndex = line.indexOf(' and ');
            if (andIndex !== -1) {
                const lhs = line.slice(0, andIndex);
                const rhs = line.slice(andIndex + 5);
                line = lhs + ' ' + rhs;
            }

            // Check for arithmetic expression in print command
            const printIndex = line.indexOf('print');
            if (printIndex !== -1) {
                const printArgs = line.slice(printIndex + 6).trim().split(' ');
                const evaluatedArgs = printArgs.map(arg => {
                    // Check if the argument is an arithmetic expression
                    if (/^\d/.test(arg)) {
                        return this.evaluateArithmetic(arg);
                    }
                    // Check if the argument is a variable
                    if (arg in this.variables) {
                        return this.variables[arg];
                    }
                    return arg;
                });
                console.log(evaluatedArgs.join(' '));
                return;
            }

            // Split each line into tokens
            const tokens = line.split(' ');

            // Extract the command (first token)
            const command = tokens[0];

            // Extract the arguments (remaining tokens)
            const args = tokens.slice(1);

            // Execute the appropriate command
            switch (command) {
                case 'set':
                    // Set command - store variable in variables object
                    const variableName = args[0];
                    const variableValue = args.slice(2).join(' ');
                    this.variables[variableName] = variableValue;
                    break;
                default:
                    // Unknown command - log error to console
                    console.error(`Unknown command: ${command}`);
            }
        });
    }
};

// Read the Eng code from the provided file
fs.readFile('file-name.eng', 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading file:', err);
        return;
    }

    // Evaluate the Eng code
    EngInterpreter.evaluate(data);
});
