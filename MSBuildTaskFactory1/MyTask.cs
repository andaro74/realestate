namespace MSBuildTaskFactory1
{
    using System;
    using System.Collections.Generic;
    using System.Diagnostics.Contracts;
    using System.IO;
    using System.Linq;
    using System.Text.RegularExpressions;
    using Microsoft.Build.Framework;
    using Microsoft.Build.Utilities;

    /// <summary>
    /// A task that executes a custom script.
    /// </summary>
    /// <remarks>
    /// This task can implement <see cref="IGeneratedTask"/> to support task properties
    /// that are defined in the script itself and not known at compile-time of this task factory.
    /// </remarks>
    internal class MyTask : Task, IDisposable
    {
        /// <summary>
        /// The task factory that generated this task.
        /// </summary>
        private readonly MSBuildTaskFactory1 taskFactory;

        /// <summary>
        /// Initializes a new instance of the <see cref="MyTask"/> class.
        /// </summary>
        internal MyTask(MSBuildTaskFactory1 factory)
        {
            Contract.Requires(factory != null);
            this.taskFactory = factory;
        }

        /// <summary>
        /// Gets or sets the message importance of the task's printed messages.
        /// </summary>
        /// <value>The message importance.</value>
        public bool Important { get; set; }

        /// <summary>
        /// When overridden in a derived class, executes the task.
        /// </summary>
        /// <returns>
        /// true if the task successfully executed; otherwise, false.
        /// </returns>
        public override bool Execute()
        {
            // Execute the custom script, which in this sample is a very simple print statement handler.
            Regex printStatement = new Regex(@"print ""(.+)""", RegexOptions.IgnoreCase);
            StringReader sr = new StringReader(this.taskFactory.Script);
            string line;
            int lineNumber = 0;
            while ((line = sr.ReadLine()) != null)
            {
                lineNumber++;
                if (string.IsNullOrWhiteSpace(line))
                {
                    continue;
                }

                Match m = printStatement.Match(line);
                if (m.Success)
                {
                    // Print the message in the task to the console.
                    MessageImportance importance = this.Important ? MessageImportance.High : MessageImportance.Normal;
                    this.Log.LogMessage(importance, m.Groups[1].Value);
                }
                else
                {
                    this.Log.LogError("Syntax error on line {0}: {1}", lineNumber, line);
                }
            }

            return !Log.HasLoggedErrors;
        }

        #region Dispose pattern

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
            this.Dispose(true);
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// Releases unmanaged and - optionally - managed resources
        /// </summary>
        /// <param name="disposing"><c>true</c> to release both managed and unmanaged resources; <c>false</c> to release only unmanaged resources.</param>
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                // Dispose of referenced objects implementing IDisposable here.
            }
        }

        #endregion
    }
}
