namespace MSBuildTaskFactory1
{
    using System;
    using System.Collections.Generic;
    using System.Diagnostics.Contracts;
    using System.Linq;
    using System.Text;
    using Microsoft.Build.Framework;

    /// <summary>
    /// A task factory that enables inline scripts to execute as part of an MSBuild-based build.
    /// </summary>
    /// <remarks>
    /// A more complete example of a task factory, that allows for Windows PowerShell scripts
    /// inside project files, can be found on MSDN Code Gallery:
    /// http://code.msdn.microsoft.com/PowershellFactory
    /// </remarks>
    public class MSBuildTaskFactory1 : ITaskFactory
    {
        /// <summary>
        /// The in and out parameters of the generated tasks.
        /// </summary>
        private IDictionary<string, TaskPropertyInfo> parameterGroup;

        /// <summary>
        /// The body of the script to execute.
        /// </summary>
        private string taskBody;

        /// <summary>
        /// Initializes a new instance of the <see cref="MSBuildTaskFactory1"/> class.
        /// </summary>
        public MSBuildTaskFactory1()
        {
        }

        /// <summary>
        /// Gets the name of the factory.
        /// </summary>
        /// <value>The name of the factory.</value>
        public string FactoryName
        {
            get { return GetType().Name; }
        }

        /// <summary>
        /// Gets the type of the task.
        /// </summary>
        /// <value>The type of the task.</value>
        public Type TaskType
        {
            get { return typeof(MyTask); }
        }

        /// <summary>
        /// The body of the script given by the project file.
        /// </summary>
        public string Script { get; private set; }

        /// <summary>
        /// Initializes the factory for creating a task with the given script.
        /// </summary>
        /// <param name="taskName">Name of the task.</param>
        /// <param name="parameterGroup">The parameter group.</param>
        /// <param name="taskBody">The task body.</param>
        /// <param name="taskFactoryLoggingHost">The task factory logging host.</param>
        /// <returns></returns>
        public bool Initialize(string taskName, IDictionary<string, TaskPropertyInfo> parameterGroup, string taskBody, IBuildEngine taskFactoryLoggingHost)
        {
            Contract.Requires(!string.IsNullOrEmpty(taskName));
            Contract.Requires(parameterGroup != null);
            Contract.Requires(taskBody != null);
            Contract.Requires(taskFactoryLoggingHost != null);

            this.parameterGroup = parameterGroup;
            this.taskBody = taskBody;
            this.Script = taskBody;

            // Add our intrinsic task properties
            this.parameterGroup["Important"] = new TaskPropertyInfo("Important", typeof(bool), false, false);

            return true;
        }

        /// <summary>
        /// Creates the task.
        /// </summary>
        /// <param name="taskFactoryLoggingHost">The task factory logging host.</param>
        /// <returns></returns>
        public ITask CreateTask(IBuildEngine taskFactoryLoggingHost)
        {
            return new MyTask(this);
        }

        /// <summary>
        /// Cleans up the task.
        /// </summary>
        /// <param name="task">The task.</param>
        public void CleanupTask(ITask task)
        {
            Contract.Requires(task != null);

            IDisposable disposableTask = task as IDisposable;
            if (disposableTask != null)
            {
                disposableTask.Dispose();
            }
        }

        /// <summary>
        /// Gets the task parameters.
        /// </summary>
        public TaskPropertyInfo[] GetTaskParameters()
        {
            return this.parameterGroup.Values.ToArray();
        }
    }
}
